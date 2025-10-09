// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract UnionBoardRepresentationDAO {
    address public originator;

    struct RepresentationScroll {
        string companyTag;
        address unionDelegate;
        string boardSignal;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    RepresentationScroll[] public representationLedger;

    constructor() {
        originator = msg.sender;
    }

    function logRepresentationScroll(
        string memory companyTag,
        address unionDelegate,
        string memory boardSignal,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        representationLedger.push(RepresentationScroll({
            companyTag: companyTag,
            unionDelegate: unionDelegate,
            boardSignal: boardSignal,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
