// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InfrastructureNeedIndexPack {
    address public admin;

    struct NeedIndex {
        string districtLabel;
        uint256 population;
        string infraGapDescription;
        string emotionalTag;
        bool prioritized;
    }

    NeedIndex[] public indices;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitIndex(string memory districtLabel, uint256 population, string memory infraGapDescription, string memory emotionalTag) external onlyAdmin {
        indices.push(NeedIndex(districtLabel, population, infraGapDescription, emotionalTag, false));
    }

    function prioritizeIndex(uint256 index) external onlyAdmin {
        indices[index].prioritized = true;
    }

    function getIndex(uint256 index) external view returns (NeedIndex memory) {
        return indices[index];
    }
}
