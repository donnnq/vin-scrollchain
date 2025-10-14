// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StrategicDecouplingProtocolDAO {
    address public admin;

    struct DecouplingEntry {
        string sector;
        string dependencyTarget;
        string decouplingStrategy;
        string emotionalTag;
        bool activated;
    }

    DecouplingEntry[] public protocols;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitProtocol(string memory _sector, string memory _dependencyTarget, string memory _decouplingStrategy, string memory _emotionalTag) external onlyAdmin {
        protocols.push(DecouplingEntry(_sector, _dependencyTarget, _decouplingStrategy, _emotionalTag, false));
    }

    function activateProtocol(uint256 index) external onlyAdmin {
        protocols[index].activated = true;
    }

    function getProtocol(uint256 index) external view returns (DecouplingEntry memory) {
        return protocols[index];
    }
}
