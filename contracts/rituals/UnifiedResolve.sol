// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UnifiedResolve {
    address public cityOracle;

    enum Level { Barangay, City, District, National }

    struct Official {
        string name;
        Level level;
        string jurisdiction;
        bool active;
    }

    struct Problem {
        string description;
        string location;
        address initiator;
        bool resolved;
        address[] contributors;
        address[] recruits;
    }

    mapping(address => Official) public officials;
    mapping(bytes32 => Problem) public problems;

    event OfficialRegistered(address indexed official, string name, Level level, string jurisdiction);
    event ProblemDeclared(bytes32 indexed problemId, string description, string location, address initiator);
    event ContributionLogged(bytes32 indexed problemId, address contributor);
    event RecruitAdded(bytes32 indexed problemId, address recruit);
    event ProblemResolved(bytes32 indexed problemId);

    modifier onlyOracle() {
        require(msg.sender == cityOracle, "Only oracle can perform this");
        _;
    }

    modifier onlyActiveOfficial() {
        require(officials[msg.sender].active, "Not an active official");
        _;
    }

    constructor(address _cityOracle) {
        cityOracle = _cityOracle;
    }

    function registerOfficial(address official, string calldata name, Level level, string calldata jurisdiction) external onlyOracle {
        officials[official] = Official(name, level, jurisdiction, true);
        emit OfficialRegistered(official, name, level, jurisdiction);
    }

    function declareProblem(string calldata description, string calldata location) external onlyActiveOfficial returns (bytes32) {
        bytes32 problemId = keccak256(abi.encodePacked(description, location, block.timestamp));
        Problem storage p = problems[problemId];
        p.description = description;
        p.location = location;
        p.initiator = msg.sender;
        emit ProblemDeclared(problemId, description, location, msg.sender);
        return problemId;
    }

    function contributeToSolution(bytes32 problemId) external onlyActiveOfficial {
        Problem storage p = problems[problemId];
        require(!p.resolved, "Already resolved");
        p.contributors.push(msg.sender);
        emit ContributionLogged(problemId, msg.sender);
    }

    function recruitAlly(bytes32 problemId, address recruit) external onlyActiveOfficial {
        require(officials[recruit].active, "Recruit must be active official");
        problems[problemId].recruits.push(recruit);
        emit RecruitAdded(problemId, recruit);
    }

    function markResolved(bytes32 problemId) external onlyOracle {
        problems[problemId].resolved = true;
        emit ProblemResolved(problemId);
    }

    // Optional: View functions for frontend or audit
    function getContributors(bytes32 problemId) external view returns (address[] memory) {
        return problems[problemId].contributors;
    }

    function getRecruits(bytes32 problemId) external view returns (address[] memory) {
        return problems[problemId].recruits;
    }
}
