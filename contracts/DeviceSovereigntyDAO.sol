// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DeviceSovereigntyDAO {
    address public admin;

    struct DeviceEntry {
        string deviceLabel;
        string sovereigntyClause;
        string emotionalTag;
        bool protected;
    }

    DeviceEntry[] public devices;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _deviceLabel, string memory _sovereigntyClause, string memory _emotionalTag) external onlyAdmin {
        devices.push(DeviceEntry(_deviceLabel, _sovereigntyClause, _emotionalTag, false));
    }

    function protectEntry(uint256 index) external onlyAdmin {
        devices[index].protected = true;
    }

    function getEntry(uint256 index) external view returns (DeviceEntry memory) {
        return devices[index];
    }
}
