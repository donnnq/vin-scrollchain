// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FactoryResurrectionProtocolDAO {
    address public admin;

    struct FactoryEntry {
        string factoryName;
        string region;
        string resurrectionClause;
        string emotionalTag;
        bool reactivated;
    }

    FactoryEntry[] public factories;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitFactory(string memory _factoryName, string memory _region, string memory _resurrectionClause, string memory _emotionalTag) external onlyAdmin {
        factories.push(FactoryEntry(_factoryName, _region, _resurrectionClause, _emotionalTag, false));
    }

    function markReactivated(uint256 index) external onlyAdmin {
        factories[index].reactivated = true;
    }

    function getFactory(uint256 index) external view returns (FactoryEntry memory) {
        return factories[index];
    }
}
