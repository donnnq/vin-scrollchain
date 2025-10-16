// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ShutdownResilienceProtocolPack {
    address public admin;

    struct ResilienceEntry {
        string departmentLabel;
        string serviceMaintained;
        string emotionalTag;
        bool operational;
    }

    ResilienceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory departmentLabel, string memory serviceMaintained, string memory emotionalTag) external onlyAdmin {
        entries.push(ResilienceEntry(departmentLabel, serviceMaintained, emotionalTag, false));
    }

    function markOperational(uint256 index) external onlyAdmin {
        entries[index].operational = true;
    }

    function getEntry(uint256 index) external view returns (ResilienceEntry memory) {
        return entries[index];
    }
}
