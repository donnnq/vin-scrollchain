// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FishImportInfluenceCodex {
    address public admin;

    struct InfluenceEntry {
        string requesterLabel;
        string importVolume;
        string companyInvolved;
        string emotionalTag;
        bool verified;
    }

    InfluenceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitInfluence(string memory requesterLabel, string memory importVolume, string memory companyInvolved, string memory emotionalTag) external onlyAdmin {
        entries.push(InfluenceEntry(requesterLabel, importVolume, companyInvolved, emotionalTag, false));
    }

    function verifyInfluence(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function getEntry(uint256 index) external view returns (InfluenceEntry memory) {
        return entries[index];
    }
}
