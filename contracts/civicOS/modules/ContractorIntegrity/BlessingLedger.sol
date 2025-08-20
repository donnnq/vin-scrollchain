// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract BlessingLedger {
    address public steward;
    mapping(address => WorkerBlessing) public blessings;

    struct WorkerBlessing {
        string name;
        uint256 hoursWorked;
        uint256 wageReceived;
        string dignityNote;
        bool blessed;
    }

    event BlessingLogged(address worker, string note);
    event WageConfirmed(address worker, uint256 amount);

    modifier onlySteward() {
        require(msg.sender == steward, "Only steward can bless");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logBlessing(address _worker, string memory _name, uint256 _hours, uint256 _wage, string memory _note) public onlySteward {
        blessings[_worker] = WorkerBlessing(_name, _hours, _wage, _note, true);
        emit BlessingLogged(_worker, _note);
        emit WageConfirmed(_worker, _wage);
    }

    function getBlessing(address _worker) public view returns (WorkerBlessing memory) {
        return blessings[_worker];
    }
}
