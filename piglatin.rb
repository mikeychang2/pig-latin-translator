# Pig Latin Translator
# Input: sentence as string
# Output: sentence in pig latin

# ========================================================
# Pseudocode
# HELPER METHOD TO PIG LATINIFY A SINGLE WORD
# 1) Create a helper method to pig-latinify a single word
# 2) Move the first letter to the end of the word
# 3) Check to see if the first letter is a vowel or consonant (if vowel, add "hay"; else, add "ay")
#
# # METHOD TO PIG LATINIFY AN ENTIRE SENTENCE
# 1) Use split() method to create an array of each word.
# 2) Iterate through each word to "translate" using pig latin translate helper method.
# 3) All punctuation must be kept the same, using helper method (use regex to find punctuation, delete punctuation from word, and append to pig latin translated word).
# 4) All capitalization must be kept the same, using helper method (check to see if word initially capitalized; if so, capitalize after translated to pig latin)
# 5) Use join() method to create a string from array
# ==========================================================

class PigLatinTranslator

  def initialize
  end

  def translate(sentence)
    return nil if sentence.empty?

    words_to_translate = sentence.split(" ")

    translated_sentence = words_to_translate.map! do |word|
        word = translate_word(word)
    end

    translated_sentence.join(" ")
  end

  private

    def capitalized?(word)
      word[0] == word[0].upcase
    end

    def fix_punctuation(word)
      punctuation = word.match(/[^A-Za-z0-9'\s]/).to_s
      word.delete(punctuation) + punctuation
    end

    def translate_word(word)
      vowels = 'aeoiuAEOIU'

      is_capitalized = capitalized?(word)
      word = word.downcase
      word << word[0]

      if vowels.include?(word[0])
        word << "hay"
      else
        word << "ay"
      end

      word = word[1..-1]
      word.capitalize! if is_capitalized
      fix_punctuation(word)
    end
end

p my_translator = PigLatinTranslator.new
p my_translator.translate("Hi, my name is Michael Chang.")
p my_translator.translate("Bacon is awesome! Sometimes, in the morning, I'll have bacon on toast for breakfast.") == "Aconbay sihay wesomeahay! Ometimessay, nihay hetay orningmay, 'llihay avehay aconbay nohay oasttay orfay reakfastbay."