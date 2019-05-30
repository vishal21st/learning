# @param {String} version1
# @param {String} version2
# @return {Integer}
def compare_version(version1, version2)
  version1 = version1.split('.')
  version2 = version2.split('.')
  max_length = [version1.length , version2.length].max
  for i in (0..(max_length - 1))
    v1 = version1[i].to_i
    v2 = version2[i].to_i
    if v1 < v2
      return -1
    elsif v1 > v2
      return 1
    end
  end
  0
end

compare_version("1", "1.1")
