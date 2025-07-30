contract vinFairWeightMirror {
    struct SymbolicValue {
        string item;
        uint dignityWeight;
    }

    mapping(bytes32 => SymbolicValue) public itemWeights;

    function assignValue(string memory item, uint dignityWeight) public {
        bytes32 hash = keccak256(abi.encodePacked(item));
        itemWeights[hash] = SymbolicValue(item, dignityWeight);
    }

    function getValue(string memory item) public view returns (uint) {
        bytes32 hash = keccak256(abi.encodePacked(item));
        return itemWeights[hash].dignityWeight;
    }
}
