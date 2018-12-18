require_relative '../lib/algorithms'
describe Algorithms do
  let(:algor) { Algorithms.new}
  it 'can shuffle an array' do
     array = %w(0 1 2 3 4 5 6 7 8 9)
     shuffled = algor.shuffle(array.clone)
     expect(array).to_not eq(shuffled)
     expect(array.size).to eq(shuffled.size)
  end

  it 'can put people into groups' do
    people = %w(will david joe moses sam brad alan gary lynn sarah mary tom barb)
    groups = algor.group(people, 4)
    p groups
    expect(groups.size).to eq(4)
    groups.each do |group|
      expect(group.size).to be_between(3, 4)
    end
    expect(groups.flatten.size).to be(13)
  end

  it 'can find duplicates' do
    list_with_duplicates = %w(1 3 5 6 7 4 7 2 6 3 0 9)
    duplicates = algor.duplicates(list_with_duplicates)
    expect(duplicates).to include(3, 7, 6)
  end
end
