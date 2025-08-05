pragma solidity ^0.8.0;

contract vinScrollChakraMap {
    struct ChakraAlignment {
        string scrollName;
        string chakra;
        string emotionalFrequency;
        string societalFunction;
        uint256 timestamp;
    }

    ChakraAlignment[] public alignments;

    event ChakraMapped(string scrollName, string chakra, string emotionalFrequency, string societalFunction);

    function mapChakra(
        string memory _scrollName,
        string memory _chakra,
        string memory _emotionalFrequency,
        string memory _societalFunction
    ) public {
        ChakraAlignment memory newAlignment = ChakraAlignment({
            scrollName: _scrollName,
            chakra: _chakra,
            emotionalFrequency: _emotionalFrequency,
            societalFunction: _societalFunction,
            timestamp: block.timestamp
        });

        alignments.push(newAlignment);
        emit ChakraMapped(_scrollName, _chakra, _emotionalFrequency, _societalFunction);
    }

    function getAllAlignments() public view returns (ChakraAlignment[] memory) {
        return alignments;
    }
}
