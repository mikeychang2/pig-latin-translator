# Reverse Pig Latin Translator
# Input: sentence as pig latin
# Output: sentence in English (string)

# ========================================================
# Pseudocode
# HELPER METHOD TO REVRESE TRANSLATE A SINGLE PIG LATIN WORD
# 1) Check for capitalization (using helper method)
# 2) Set and remove punctuation (if it exists)
# 3) Downcase the word.
# 2) Check the last three characters of word.
# 3) If the third to the last is an "h" then first of English word is a vowel (take last character of word and prepend); else, first letter is consonant (take first character of removed word and prepend)
# 4) Capitalize if is_capitalized?
# 5) Add punctuation if punctuation?

# METHOD TO REVERSE AN ENTIRE SENTENCE
# 1) Use split() method to create array of each word.
# 2) Iterate through array & use reverse_translate_word helper method to translate each word.
# 3) Use join() method to create sentence string.

class ReversePigLatinTranslator

  def initialize
  end

  def reverse_translate(sentence)
    words_to_reverse_translate = sentence.split(" ")

    translated_sentence = words_to_reverse_translate.map! do |word|
        word = reverse_translate_word(word)
    end

    translated_sentence.join(" ")
  end

  private
    def capitalized?(word)
      word[0] == word[0].upcase
    end

    # def punctuation?(word)
    #   word.match(/[^A-Za-z0-9'\s]/) != nil
    # end

    def reverse_translate_word(word)
      is_capitalized = capitalized?(word)
      punctuation = word.match(/[^A-Za-z0-9'\s]/).to_s

      word = word.delete(punctuation)
      word = word.downcase

      if word[-3] == "h"
        word.prepend(word[-4])
        word = word[0..-5]
      else
        word.prepend(word[-3])
        word = word[0..-4]
      end

      word.capitalize! if is_capitalized
      word + punctuation
    end

  end

p my_reverse_translator = ReversePigLatinTranslator.new
p my_reverse_translator.reverse_translate("Ymay amenay sihay Ichaelmay Hangcay.")
p my_reverse_translator.reverse_translate("Ometimessay, nihay hetay orningmay, 'llihay avehhay aconbay nohay oasttay orfay reakfastbay.")
