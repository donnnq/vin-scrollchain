// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BuilderReputationLedgerDAO {
    address public admin;

    struct Builder {
        address wallet;
        string name;
        uint256 completedProjects;
        uint256 reputationScore;
    }

    mapping(address => Builder) public builders;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerBuilder(address _wallet, string memory _name) external onlyAdmin {
        builders[_wallet] = Builder(_wallet, _name, 0, 0);
    }

    function updateReputation(address _wallet, uint256 _projects, uint256 _score) external onlyAdmin {
        builders[_wallet].completedProjects += _projects;
        builders[_wallet].reputationScore += _score;
    }

    function getBuilder(address _wallet) external view returns (Builder memory) {
        return builders[_wallet];
    }
}
