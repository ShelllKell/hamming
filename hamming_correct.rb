require_relative "testing_library"

def hamming(strand_1, strand_2)
  array1 = strand_1.split(//)
  array2 = strand_2.split(//)
  columns = 0
  diff = 0
  while columns < 6
    if array1[columns] != array2[columns] && array1.length == array2.length
      diff = diff + 1
    end
    columns = columns + 1
  end
  diff
end

check("Hamming distance between identical strands",
      hamming("A", "A") == 0)

check("Hamming distance for single nucleotide strand",
      hamming("A", "G") == 1)

check("Hamming distance between small strands",
      hamming("AG", "CT") == 2)

check("Hamming distance between two other small strands",
      hamming("AT", "CT") == 1)

check("Hamming distance in longer strands",
      hamming("GGACG", "GGTCG") == 1)

check("Ignoring extra length in the first strand when it's longer",
      hamming("AAAG", "AAA") == 0)

check("Ignoring extra length in the second strand when it's longer",
      hamming("AAA", "AAAG") == 0)