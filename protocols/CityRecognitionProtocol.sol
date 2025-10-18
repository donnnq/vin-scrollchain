// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CityRecognitionProtocol {
    address public admin;

    struct RecognitionEntry {
        string productName;
        string city;
        string emotionalTag;
        bool summoned;
        bool nominated;
        bool awarded;
    }

    RecognitionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRecognition(string memory productName, string memory city, string memory emotionalTag) external onlyAdmin {
        entries.push(RecognitionEntry(productName, city, emotionalTag, true, false, false));
    }

    function nominateProduct(uint256 index) external onlyAdmin {
        entries[index].nominated = true;
    }

    function awardRecognition(uint256 index) external onlyAdmin {
        require(entries[index].nominated, "Must be nominated first");
        entries[index].awarded = true;
    }

    function getRecognitionEntry(uint256 index) external view returns (RecognitionEntry memory) {
        return entries[index];
    }
}
