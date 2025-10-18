// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StreamingDeviceOverrideCodex {
    address public admin;

    struct DeviceEntry {
        string deviceName;
        string exploitName;
        string emotionalTag;
        bool summoned;
        bool overrideEnabled;
        bool patched;
    }

    DeviceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonDevice(string memory deviceName, string memory exploitName, string memory emotionalTag) external onlyAdmin {
        entries.push(DeviceEntry(deviceName, exploitName, emotionalTag, true, false, false));
    }

    function enableOverride(uint256 index) external onlyAdmin {
        entries[index].overrideEnabled = true;
    }

    function patchDevice(uint256 index) external onlyAdmin {
        entries[index].patched = true;
    }

    function getDeviceEntry(uint256 index) external view returns (DeviceEntry memory) {
        return entries[index];
    }
}
