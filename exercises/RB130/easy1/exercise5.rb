CONVERSION = ('a'..'z').to_a

def encript(str)
  words = str.downcase.split
  new = []
  words.each do |word|
    new << (word.chars.map do |char|
      if CONVERSION.include?(char)
        CONVERSION.fetch((CONVERSION.index(char) + 13) % 26)
      else
        char
      end
    end).join
  end
  new.join(' ')
end

NAMES = [
  "Nqn Ybirynpr",
  "Tenpr Ubccre",
  "Nqryr Tbyqfgvar",
  "Nyna Ghevat",
  "Puneyrf Onoontr",
  "Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv",
  "Wbua Ngnanfbss",
  "Ybvf Unvog",
  "Pynhqr Funaaba",
  "Fgrir Wbof",
  "Ovyy Tngrf",
  "Gvz Orearef-Yrr",
  "Fgrir Jbmavnx",
  "Xbaenq Mhfr",
  "Fve Nagbal Ubner",
  "Zneiva Zvafxl",
  "Lhxvuveb Zngfhzbgb",
  "Unllvz Fybavzfxv",
  "Tregehqr Oynapu"
  ]

p NAMES.map { |name| encript(name) }
