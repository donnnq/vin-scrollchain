// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract RareEarthTariffDAO {
    address public originator;

    struct TariffSignal {
        string mineralType;
        string originNation;
        uint256 tariffRate;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    TariffSignal[] public tariffLedger;

    constructor() {
        originator = msg.sender;
    }

    function logTariffSignal(
        string memory mineralType,
        string memory originNation,
        uint256 tariffRate,
        bool isScrollchainSealed
    ) external {
        tariffLedger.push(TariffSignal({
            mineralType: mineralType,
            originNation: originNation,
            tariffRate: tariffRate,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
