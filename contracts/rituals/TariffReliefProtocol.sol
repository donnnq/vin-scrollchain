// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TariffReliefProtocol {
    address public steward;

    struct TradeItem {
        string name;
        uint256 importTariff;
        uint256 exportTariff;
        bool isEssential;
        bool reliefGranted;
    }

    mapping(string => TradeItem) public items;

    event TariffSet(string item, uint256 importTariff, uint256 exportTariff, bool isEssential);
    event ReliefActivated(string item, uint256 newImportTariff, uint256 newExportTariff);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Only steward can perform this action");
        _;
    }

    function setTariff(string memory itemName, uint256 importRate, uint256 exportRate, bool essential) public onlySteward {
        items[itemName] = TradeItem(itemName, importRate, exportRate, essential, false);
        emit TariffSet(itemName, importRate, exportRate, essential);
    }

    function activateRelief(string memory itemName) public onlySteward {
        TradeItem storage item = items[itemName];
        require(item.isEssential, "Item must be marked essential");
        require(!item.reliefGranted, "Relief already granted");

        item.importTariff = 0;
        item.exportTariff = 0;
        item.reliefGranted = true;

        emit ReliefActivated(itemName, 0, 0);
    }

    function getTariff(string memory itemName) public view returns (uint256, uint256, bool, bool) {
        TradeItem memory item = items[itemName];
        return (item.importTariff, item.exportTariff, item.isEssential, item.reliefGranted);
    }
}
