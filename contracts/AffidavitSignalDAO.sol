// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract AffidavitSignalDAO {
    address public originator;

    struct AffidavitSignal {
        string officialName;
        string region;
        string breachClaim;
        string affidavitLink;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    AffidavitSignal[] public affidavitLedger;

    constructor() {
        originator = msg.sender;
    }

    function logAffidavitSignal(
        string memory officialName,
        string memory region,
        string memory breachClaim,
        string memory affidavitLink,
        bool isScrollchainSealed
    ) external {
        affidavitLedger.push(AffidavitSignal({
            officialName: officialName,
            region: region,
            breachClaim: breachClaim,
            affidavitLink: affidavitLink,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
