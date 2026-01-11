module ApplicationHelper
  # Build a URL for switching locale while preserving current path and query.
  # Removes any leading locale (e.g. /hy or /en) and prefixes the requested locale.
  #
  # Examples:
  #  current: /hy/about        -> switch_locale_url('en') => /en/about
  #  current: /departments/1   -> switch_locale_url('hy') => /hy/departments/1
  #
  # Falls back to I18n.available_locales if Locale DB is not accessible.
  def switch_locale_url(locale)
    # Allowed locale codes (DB-driven if available; otherwise from I18n)
    enabled_codes = begin
      Locale.enabled_codes
    rescue StandardError
      I18n.available_locales.map(&:to_s)
    end

    # Parse current fullpath including query
    uri = URI.parse(request.fullpath)
    current_path = uri.path

    # Remove leading locale if it exists (e.g. /en or /hy)
    if enabled_codes.any?
      current_path = current_path.sub(%r{^/(#{enabled_codes.join('|')})(/|$)}, '/')
    end

    # Ensure we always have a path beginning with '/'
    current_path = '/' if current_path.blank?

    # Prefix with the requested locale
    new_path = "/#{locale}#{current_path}"

    # Collapse any duplicated slashes (e.g. // -> /)
    new_path = new_path.gsub(%r{/+}, '/')

    # Restore query string if present
    new_path += "?#{uri.query}" if uri.query.present?

    new_path
  end
end
