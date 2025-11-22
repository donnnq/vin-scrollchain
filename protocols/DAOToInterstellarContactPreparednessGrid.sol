// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToInterstellarContactPreparednessGrid {
    string public batchID = "1321.9.109";
    string public steward = "Vinvin";

    address public admin;

    struct Drill {
        string scenario; // e.g., "peaceful contact", "signal reception"
        uint256 timestamp;
        bool completed;
    }

    mapping(bytes32 => Drill) public drills;

    event DrillLogged(bytes32 indexed key, string scenario);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logDrill(string memory scenario) public onlyAdmin returns (bytes32 key) {
        key = keccak256(abi.encodePacked(scenario, block.timestamp));
        drills[key] = Drill(scenario, block.timestamp, false);
        emit DrillLogged(key, scenario);
    }

    function completeDrill(bytes32 key) public onlyAdmin {
        drills[key].completed = true;
    }

    function getDrill(bytes32 key) public view returns (string memory scenario, uint256 timestamp, bool completed) {
        Drill memory d = drills[key];
        return (d.scenario, d.timestamp, d.completed);
    }
}
