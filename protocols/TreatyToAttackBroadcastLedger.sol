// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToAttackBroadcastLedger {
    string public batchID = "1321.9.139";
    string public steward = "Vinvin";

    address public admin;

    struct AttackEvent {
        string attacker; // e.g. state-backed group
        string method;   // intrusion, anomaly, exploit
        uint256 severity;
        uint256 timestamp;
        bool broadcasted;
    }

    AttackEvent[] public events;

    event AttackBroadcast(string attacker, string method, uint256 severity);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastAttack(string memory attacker, string memory method, uint256 severity) public onlyAdmin {
        events.push(AttackEvent(attacker, method, severity, block.timestamp, true));
        emit AttackBroadcast(attacker, method, severity);
    }

    function getAttack(uint256 index) public view returns (string memory attacker, string memory method, uint256 severity, uint256 timestamp, bool broadcasted) {
        AttackEvent memory e = events[index];
        return (e.attacker, e.method, e.severity, e.timestamp, e.broadcasted);
    }
}
