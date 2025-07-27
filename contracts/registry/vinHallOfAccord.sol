// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinHallOfAccord {
    struct Member {
        address addr;
        string faction;
        string symbol;
        bool blessed;
    }

    struct ScrollProposal {
        uint id;
        string title;
        string ritual;
        address proposer;
        uint votesFor;
        uint votesAgainst;
        bool reconciled;
    }

    mapping(address => Member) public members;
    mapping(uint => ScrollProposal) public scrolls;
    uint public scrollCount;

    event Joined(address indexed member, string faction, string symbol);
    event ScrollSubmitted(uint indexed scrollId, string title);
    event RitualPerformed(uint indexed scrollId, address indexed voter, bool support);
    event ScrollReconciled(uint indexed scrollId);

    modifier onlyMember() {
        require(bytes(members[msg.sender].faction).length != 0, "Not a member");
        _;
    }

    function joinHall(string memory faction, string memory symbol) public {
        require(bytes(members[msg.sender].faction).length == 0, "Already joined");
        members[msg.sender] = Member(msg.sender, faction, symbol, false);
        emit Joined(msg.sender, faction, symbol);
    }

    function submitScroll(string memory title, string memory ritual) public onlyMember {
        scrollCount++;
        scrolls[scrollCount] = ScrollProposal(
            scrollCount, title, ritual, msg.sender, 0, 0, false
        );
        emit ScrollSubmitted(scrollCount, title);
    }

    function performRitual(uint scrollId, bool support) public onlyMember {
        require(!scrolls[scrollId].reconciled, "Already reconciled");
        if (support) {
            scrolls[scrollId].votesFor++;
        } else {
            scrolls[scrollId].votesAgainst++;
        }
        emit RitualPerformed(scrollId, msg.sender, support);
    }

    function reconcileScroll(uint scrollId) public onlyMember {
        ScrollProposal storage scroll = scrolls[scrollId];
        require(!scroll.reconciled, "Already reconciled");
        require(scroll.votesFor > scroll.votesAgainst, "Insufficient support");
        scroll.reconciled = true;
        members[scroll.proposer].blessed = true;
        emit ScrollReconciled(scrollId);
    }
}
