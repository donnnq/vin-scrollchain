// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinNomineeQueueDebugger {
    struct Nominee {
        string name;
        uint timestamp;
        string role;
        bool reviewedByAI;
        bool confirmed;
        string decisionNotes;
    }

    Nominee[] public queue;
    address public reviewerAI;

    event NomineeAdded(string name, string role);
    event NomineeReviewed(string name, bool confirmed, string notes);

    constructor() {
        reviewerAI = msg.sender; // symbolic AI authority
    }

    modifier onlyAI() {
        require(msg.sender == reviewerAI, "Not authorized AI");
        _;
    }

    function addNominee(string memory name, string memory role) public {
        queue.push(Nominee(name, block.timestamp, role, false, false, ""));
        emit NomineeAdded(name, role);
    }

    function reviewNominee(uint index, bool confirm, string memory notes) public onlyAI {
        require(index < queue.length, "Invalid index");
        Nominee storage n = queue[index];
        n.reviewedByAI = true;
        n.confirmed = confirm;
        n.decisionNotes = notes;
        emit NomineeReviewed(n.name, confirm, notes);
    }

    function getPendingNominees() public view returns (Nominee[] memory) {
        uint count = 0;
        for (uint i = 0; i < queue.length; i++) {
            if (!queue[i].confirmed) count++;
        }

        Nominee[] memory pending = new Nominee[](count);
        uint j = 0;
        for (uint i = 0; i < queue.length; i++) {
            if (!queue[i].confirmed) {
                pending[j] = queue[i];
                j++;
            }
        }

        return pending;
    }
}
