// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinJusticeRecoveryRelay {
    struct Victim {
        string name;
        uint256 confiscatedAmount;
        bool recovered;
    }

    mapping(address => Victim) public victims;
    address public scrollkeeper;

    event FundLogged(address indexed victim, uint256 amount);
    event RecoveryTriggered(address indexed victim, uint256 amount);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Only Scrollkeeper may manage justice");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logConfiscatedFunds(address _victim, string memory _name, uint256 _amount) public onlyScrollkeeper {
        victims[_victim] = Victim(_name, _amount, false);
        emit FundLogged(_victim, _amount);
    }

    function triggerRecovery(address _victim) public onlyScrollkeeper {
        Victim storage v = victims[_victim];
        require(!v.recovered, "Already recovered");
        require(v.confiscatedAmount > 0, "No funds to recover");

        v.recovered = true;
        emit RecoveryTriggered(_victim, v.confiscatedAmount);
    }

    function getRecoveryStatus(address _victim) public view returns (bool) {
        return victims[_victim].recovered;
    }

    function getConfiscatedAmount(address _victim) public view returns (uint256) {
        return victims[_victim].confiscatedAmount;
    }
}
