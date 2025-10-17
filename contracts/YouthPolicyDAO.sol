// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthPolicyDAO {
    address public admin;

    struct PolicyEntry {
        string policyTitle;
        string region;
        string emotionalTag;
        bool proposed;
        bool ratified;
    }

    PolicyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function proposePolicy(string memory policyTitle, string memory region, string memory emotionalTag) external onlyAdmin {
        entries.push(PolicyEntry(policyTitle, region, emotionalTag, true, false));
    }

    function ratifyPolicy(uint256 index) external onlyAdmin {
        entries[index].ratified = true;
    }

    function getPolicy(uint256 index) external view returns (PolicyEntry memory) {
        return entries[index];
    }
}
