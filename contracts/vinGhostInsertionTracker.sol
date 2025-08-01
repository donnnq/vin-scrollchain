contract vinGhostInsertionTracker {
    struct CivicLine {
        string label;
        uint256 value;
        bool passedSanity;
    }

    mapping(uint256 => CivicLine) public insertions;
    event GhostDetected(uint256 id, string label, bool passedSanity);

    function submitInsertion(uint256 id, string memory label, uint256 value) public {
        bool isClean = civicSanityScan(label, value);
        insertions[id] = CivicLine(label, value, isClean);
        emit GhostDetected(id, label, isClean);
    }

    function civicSanityScan(string memory label, uint256 value) internal pure returns (bool) {
        if (bytes(label).length < 6 || value < 15) return false;
        return !isGhostPhrase(label);
    }

    function isGhostPhrase(string memory phrase) internal pure returns (bool) {
        return keccak256(bytes(phrase)) == keccak256(bytes("kickback"));
    }
}
