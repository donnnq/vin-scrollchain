// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TariffEraWorkerDisplacementPackDAO {
    address public admin;

    struct DisplacementEntry {
        string region;
        string tariffImpact;
        string emotionalTag;
        bool verified;
    }

    DisplacementEntry[] public displacements;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitDisplacement(string memory _region, string memory _tariffImpact, string memory _emotionalTag) external onlyAdmin {
        displacements.push(DisplacementEntry(_region, _tariffImpact, _emotionalTag, false));
    }

    function verifyDisplacement(uint256 index) external onlyAdmin {
        displacements[index].verified = true;
    }

    function getDisplacement(uint256 index) external view returns (DisplacementEntry memory) {
        return displacements[index];
    }
}
