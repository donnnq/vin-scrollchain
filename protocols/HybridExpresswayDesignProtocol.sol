// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HybridExpresswayDesignProtocol {
    address public admin;

    struct DesignEntry {
        string projectName; // "PAREX"
        string hybridFeature; // "Bike lane", "Pedestrian walkway", "Bus rapid transit"
        string designSignal; // "Inclusive mobility", "Green corridor", "Noise shielding"
        string emotionalTag;
        bool designed;
        bool sealed;
    }

    DesignEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function designHybridFeature(string memory projectName, string memory hybridFeature, string memory designSignal, string memory emotionalTag) external onlyAdmin {
        entries.push(DesignEntry(projectName, hybridFeature, designSignal, emotionalTag, true, false));
    }

    function sealDesignEntry(uint256 index) external onlyAdmin {
        require(entries[index].designed, "Must be designed first");
        entries[index].sealed = true;
    }

    function getDesignEntry(uint256 index) external view returns (DesignEntry memory) {
        return entries[index];
    }
}
