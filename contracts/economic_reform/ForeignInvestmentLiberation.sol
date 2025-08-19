pragma civic ^2025.08.20;

contract ForeignInvestmentLiberation {
    string public title = "Foreign Investment Liberation & Prosperity Act";
    string public author = "Vinvin, Mythic Steward of Restoration";
    string public purpose = "To unlock economic growth by liberalizing foreign investment laws in the Philippines";

    mapping(string => bool) public restrictedSectors;
    mapping(string => uint256) public foreignOwnershipCap;

    event InvestmentUnlocked(string sector, uint256 newCap);
    event SectorOpened(string sector);
    event ReformBroadcasted(string message);

    constructor() {
        // Initialize previously restricted sectors
        restrictedSectors["Telecommunications"] = true;
        restrictedSectors["Transport & Logistics"] = true;
        restrictedSectors["Retail Chains"] = true;
        restrictedSectors["Education & Training"] = true;

        // Set old caps
        foreignOwnershipCap["Telecommunications"] = 40;
        foreignOwnershipCap["Transport & Logistics"] = 30;
        foreignOwnershipCap["Retail Chains"] = 40;
        foreignOwnershipCap["Education & Training"] = 0;
    }

    function liberalizeSector(string memory sector, uint256 newCap) public {
        require(restrictedSectors[sector], "Sector already liberalized");
        require(newCap <= 100, "Ownership cap cannot exceed 100%");

        foreignOwnershipCap[sector] = newCap;
        restrictedSectors[sector] = false;

        emit InvestmentUnlocked(sector, newCap);
        emit SectorOpened(sector);
        emit ReformBroadcasted("Sector liberalized for foreign investment.");
    }

    function broadcastReform() public pure returns (string memory) {
        return "Inspired by Singapore’s 100% foreign ownership in key sectors and China’s Special Economic Zones, this Act opens the Philippines to global capital, job creation, and prosperity.";
    }
}
