// SPDX-License-Identifier: Scrollkeeper
pragma solidity ^0.8.0;

contract vinScrollkeeperExplainerDAO {
    address public scrollkeeper;
    uint public explainerCount;

    struct Explainer {
        string name;
        string specialty; // e.g. "Civic Law", "Blockchain Ethics", "Emotional Resonance"
        string style;     // e.g. "Elegant", "Assertive", "Gentle"
        bool isApproved;
    }

    mapping(uint => Explainer) public explainers;

    event ExplainerApproved(string name, string specialty, string style);
    event ExplainerAssignedToScroll(string explainerName, string scrollName);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Only Scrollkeeper can approve explainers");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function approveExplainer(
        string memory _name,
        string memory _specialty,
        string memory _style
    ) public onlyScrollkeeper {
        explainers[explainerCount++] = Explainer(_name, _specialty, _style, true);
        emit ExplainerApproved(_name, _specialty, _style);
    }

    function assignExplainerToScroll(uint _explainerId, string memory _scrollName) public onlyScrollkeeper {
        require(explainers[_explainerId].isApproved, "Explainer not approved");
        emit ExplainerAssignedToScroll(explainers[_explainerId].name, _scrollName);
    }
}
