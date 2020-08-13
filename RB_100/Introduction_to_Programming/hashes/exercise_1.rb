family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }


immediate = family.select { |title, names| title == :sisters || title == :brothers}
array = immediate.values.flatten
print array