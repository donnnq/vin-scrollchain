// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalColdWarImmunityProtocolDAO {
    address public admin;

    struct ImmunityEntry {
        string techSector;
        string geopoliticalThreat;
        string immunityStrategy;
        string emotionalTag;
        bool deployed;
    }

    ImmunityEntry[] public protocols;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitProtocol(string memory _techSector, string memory _geopoliticalThreat, string memory _immunityStrategy, string memory _emotionalTag) external onlyAdmin {
        protocols.push(ImmunityEntry(_techSector, _geopoliticalThreat, _immunityStrategy, _emotionalTag, false));
    }

    function deployProtocol(uint256 index) external onlyAdmin {
        protocols[index].deployed = true;
    }

    function getProtocol(uint256 index) external view returns (ImmunityEntry memory) {
        return protocols[index];
    }
}
