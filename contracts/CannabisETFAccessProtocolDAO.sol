// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CannabisETFAccessProtocolDAO {
    address public admin;

    struct ETFEntry {
        string fundName;
        string accessStatus;
        string platform;
        string emotionalTag;
        bool activated;
    }

    ETFEntry[] public protocols;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitETF(string memory _fundName, string memory _accessStatus, string memory _platform, string memory _emotionalTag) external onlyAdmin {
        protocols.push(ETFEntry(_fundName, _accessStatus, _platform, _emotionalTag, false));
    }

    function activateETF(uint256 index) external onlyAdmin {
        protocols[index].activated = true;
    }

    function getETF(uint256 index) external view returns (ETFEntry memory) {
        return protocols[index];
    }
}
