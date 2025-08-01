// SPDX-License-Identifier: Ethos-License
pragma solidity ^0.8.0;

/// @title Global Empathy DAO — for humanitarian input and cultural resonance
/// @author vinvin.eth

contract vinGlobalEmpathyDAO {
    struct Proposal {
        string title;
        string message;
        bool accepted;
    }

    Proposal[] public empathyScrolls;
    address public initiator;

    event ScrollProposed(uint256 indexed id, string title);
    event ScrollAccepted(uint256 indexed id, string title);

    constructor() {
        initiator = msg.sender;
    }

    function proposeScroll(string memory _title, string memory _message) external {
        empathyScrolls.push(Proposal(_title, _message, false));
        emit ScrollProposed(empathyScrolls.length - 1, _title);
    }

    function acceptScroll(uint256 _id) external {
        require(msg.sender == initiator, "Only initiator can accept.");
        empathyScrolls[_id].accepted = true;
        emit ScrollAccepted(_id, empathyScrolls[_id].title);
    }

    function getProposal(uint256 _id) external view returns (Proposal memory) {
        return empathyScrolls[_id];
    }
}
