// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToBroadcastLedger {
    string public batchID = "Succession-001";
    string public steward = "Vinvin";

    address public admin;

    struct BroadcastEvent {
        string remark;   // rhetorical remark, Palace response, public discourse
        uint256 impact;
        uint256 timestamp;
        bool broadcasted;
    }

    BroadcastEvent[] public events;

    event BroadcastLogged(string remark, uint256 impact);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastRemark(string memory remark, uint256 impact) public onlyAdmin {
        events.push(BroadcastEvent(remark, impact, block.timestamp, true));
        emit BroadcastLogged(remark, impact);
    }

    function getBroadcast(uint256 index) public view returns (string memory remark, uint256 impact, uint256 timestamp, bool broadcasted) {
        BroadcastEvent memory e = events[index];
        return (e.remark, e.impact, e.timestamp, e.broadcasted);
    }
}
