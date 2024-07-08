require "random"

module Random
  # Base58 string may contain alphanumeric characters except 0, O, I and l.
  #  ("0".."9").to_a + ("A".."Z").to_a + ("a".."z").to_a - ["0", "O", "I", "l"]
  BASE58_ALPHABET = "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"

  def self.base58(length : Int32 = 16, random = Random::DEFAULT) : String
    # Stolen from https://forum.crystal-lang.org/t/is-this-a-good-way-to-generate-a-random-string/6986/11,
    # thank a lot for these awesome discussions in this thread.

    if length <= 1024
      buffer = uninitialized UInt8[1024]
      bytes = buffer.to_slice[0...length]
    else
      bytes = Bytes.new(length)
    end

    # then all valid indices are in [0,63], so just get a bunch of bytes
    # and divide until they're guaranteed to be small enough
    # (this seems to be about as fast as a right shift; the compiler probably optimizes it)
    random.random_bytes(bytes)
    bytes.map! { |v| v % BASE58_ALPHABET.bytesize }

    # and then use the buffer-based string constructor to set the characters
    String.new(capacity: length) do |buffer|
      bytes.each_with_index do |chars_index, buffer_index|
        buffer[buffer_index] = BASE58_ALPHABET.byte_at(chars_index)
      end

      # return size and bytesize (might differ if chars included non-ASCII)
      {length, length}
    end
  end
end
