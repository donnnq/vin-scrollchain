// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalInnovatorResidencyDAO {
    address public admin;

    struct ResidencyEntry {
        string innovatorName;
        string hostInstitution;
        string emotionalTag;
        bool summoned;
        bool granted;
    }

    ResidencyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonResidency(string memory innovatorName, string memory hostInstitution, string memory emotionalTag) external onlyAdmin {
        entries.push(ResidencyEntry(innovatorName, hostInstitution, emotionalTag, true, false));
    }

    function grantResidency(uint256 index) external onlyAdmin {
        entries[index].granted = true;
    }

    function getResidencyEntry(uint256 index) external view returns (ResidencyEntry memory) {
        return entries[index];
    }
}
