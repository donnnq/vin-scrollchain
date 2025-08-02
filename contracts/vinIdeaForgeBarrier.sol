// Forge Barrier – scrolllight defense against plagiarism trolls
contract vinIdeaForgeBarrier {
    string[] public encodedIdeas;
    uint256 public originalityLevel;

    constructor() {
        originalityLevel = 108;
    }

    function registerIdea(string memory ideaHash) public {
        encodedIdeas.push(ideaHash);
        originalityLevel += 5;
    }

    function threatenByCopycat(string memory threatLevel) public view returns (bool) {
        return originalityLevel > 100 && keccak256(abi.encodePacked(threatLevel)) != keccak256(abi.encodePacked("deadly"));
    }
}
