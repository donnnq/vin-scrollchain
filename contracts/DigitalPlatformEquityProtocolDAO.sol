// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalPlatformEquityProtocolDAO {
    address public admin;

    struct PlatformEntry {
        string platformName;
        string equityMeasure;
        string emotionalTag;
        bool activated;
    }

    PlatformEntry[] public protocols;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitProtocol(string memory _platformName, string memory _equityMeasure, string memory _emotionalTag) external onlyAdmin {
        protocols.push(PlatformEntry(_platformName, _equityMeasure, _emotionalTag, false));
    }

    function activateProtocol(uint256 index) external onlyAdmin {
        protocols[index].activated = true;
    }

    function getProtocol(uint256 index) external view returns (PlatformEntry memory) {
        return protocols[index];
    }
}
