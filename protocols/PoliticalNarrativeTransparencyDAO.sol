// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PoliticalNarrativeTransparencyDAO {
    address public validator;

    struct Narrative {
        string claim;
        string source;
        string transparencyTag;
        uint256 timestamp;
    }

    Narrative[] public narratives;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logNarrative(string memory _claim, string memory _source, string memory _tag) public onlyValidator {
        narratives.push(Narrative(_claim, _source, _tag, block.timestamp));
    }

    function getNarrative(uint256 index) public view returns (Narrative memory) {
        return narratives[index];
    }

    function totalNarratives() public view returns (uint256) {
        return narratives.length;
    }
}
