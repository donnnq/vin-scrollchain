// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DeviceSovereigntyRestorationDAO {
    address public admin;

    struct DeviceEntry {
        string deviceName;
        string breachType;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool restored;
    }

    DeviceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonDevice(string memory deviceName, string memory breachType, string memory emotionalTag) external onlyAdmin {
        entries.push(DeviceEntry(deviceName, breachType, emotionalTag, true, false, false));
    }

    function auditDevice(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function restoreDevice(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].restored = true;
    }

    function getDeviceEntry(uint256 index) external view returns (DeviceEntry memory) {
        return entries[index];
    }
}
