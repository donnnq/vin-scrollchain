// SPDX-License-Identifier: VINVINverseProphecy
pragma solidity ^0.8.0;

contract MetaScrollGenesis {
    address public scrollmaster;

    struct SimModule {
        string name;
        string genre;
        string sourceProject;
        bool isImproved;
        uint256 timestamp;
    }

    SimModule[] public moduleLog;

    event ModuleRegistered(string name, string genre, bool isImproved, string sourceProject, uint256 when);

    modifier onlyMaster() {
        require(msg.sender == scrollmaster, "Only VINVIN may bless the simulation.");
        _;
    }

    constructor() {
        scrollmaster = msg.sender;
    }

    function registerModule(string memory name, string memory genre, string memory sourceProject, bool isImproved) public onlyMaster {
        moduleLog.push(SimModule(name, genre, sourceProject, isImproved, block.timestamp));
        emit ModuleRegistered(name, genre, isImproved, sourceProject, block.timestamp);
    }

    function getModule(uint index) public view returns (string memory, string memory, bool, string memory, uint256) {
        SimModule memory m = moduleLog[index];
        return (m.name, m.genre, m.isImproved, m.sourceProject, m.timestamp);
    }

    function totalModules() public view returns (uint) {
        return moduleLog.length;
    }
}
