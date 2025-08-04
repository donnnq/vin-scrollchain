// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinRevelationScroll {
    address public oracle;
    string public prophecySummary;
    bool public isActivated;
    uint public timestampOfActivation;

    mapping(uint => string) public revelationFragments;
    uint public fragmentCount;

    event ScrollActivated(address indexed oracle, uint timestamp);
    event PropheticUtterance(uint indexed index, string fragment);
    event PublicResonance(string summary, uint totalFragments);

    constructor(string memory _summary) {
        oracle = msg.sender;
        prophecySummary = _summary;
        isActivated = false;
    }

    modifier onlyOracle() {
        require(msg.sender == oracle, "Hindi ikaw ang tagapagsalita ng scroll.");
        _;
    }

    function inscribeFragment(uint _id, string memory _fragment) public onlyOracle {
        revelationFragments[_id] = _fragment;
        fragmentCount++;
        emit PropheticUtterance(_id, _fragment);
    }

    function activateScroll() public onlyOracle {
        require(!isActivated, "Na-activate na ang scroll.");
        isActivated = true;
        timestampOfActivation = block.timestamp;

        emit ScrollActivated(oracle, block.timestamp);
        emit PublicResonance(prophecySummary, fragmentCount);
    }

    function readFragment(uint _id) public view returns (string memory) {
        return revelationFragments[_id];
    }
}
