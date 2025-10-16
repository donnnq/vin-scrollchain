// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PureCoderRecognitionDAO {
    address public admin;

    struct RecognitionEntry {
        string coderLabel;
        string projectTitle;
        string emotionalTag;
        bool verified;
        bool honored;
    }

    RecognitionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitRecognition(string memory coderLabel, string memory projectTitle, string memory emotionalTag) external onlyAdmin {
        entries.push(RecognitionEntry(coderLabel, projectTitle, emotionalTag, false, false));
    }

    function verifyCoder(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function honorCoder(uint256 index) external onlyAdmin {
        entries[index].honored = true;
    }

    function getRecognition(uint256 index) external view returns (RecognitionEntry memory) {
        return entries[index];
    }
}
