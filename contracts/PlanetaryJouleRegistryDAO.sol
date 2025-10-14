// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryJouleRegistryDAO {
    address public admin;

    struct JouleEntry {
        string region;
        string energySource;
        uint256 jouleCount;
        string emotionalTag;
        bool verified;
    }

    JouleEntry[] public registry;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logJoule(string memory _region, string memory _energySource, uint256 _jouleCount, string memory _emotionalTag) external onlyAdmin {
        registry.push(JouleEntry(_region, _energySource, _jouleCount, _emotionalTag, false));
    }

    function verifyJoule(uint256 index) external onlyAdmin {
        registry[index].verified = true;
    }

    function getJoule(uint256 index) external view returns (JouleEntry memory) {
        return registry[index];
    }
}
