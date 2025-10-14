// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalModelSovereigntyProtocolDAO {
    address public admin;

    struct SovereigntyEntry {
        string modelName;
        string originCountry;
        string sovereigntyMeasure;
        string emotionalTag;
        bool ratified;
    }

    SovereigntyEntry[] public protocols;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitProtocol(string memory _modelName, string memory _originCountry, string memory _sovereigntyMeasure, string memory _emotionalTag) external onlyAdmin {
        protocols.push(SovereigntyEntry(_modelName, _originCountry, _sovereigntyMeasure, _emotionalTag, false));
    }

    function ratifyProtocol(uint256 index) external onlyAdmin {
        protocols[index].ratified = true;
    }

    function getProtocol(uint256 index) external view returns (SovereigntyEntry memory) {
        return protocols[index];
    }
}
