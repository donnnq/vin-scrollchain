pragma civic ^2025.08.20;

contract ReformImpactTracker {
    string public title = "Reform Impact Tracker";
    string public steward = "Vinvin";
    string public reformLinked = "Foreign Investment Liberation & Prosperity Act";

    struct SectorImpact {
        string sector;
        uint256 jobsCreated;
        uint256 capitalInflowUSD;
        uint256 OFWsReintegrated;
        uint256 newBusinessesRegistered;
        uint256 emotionalAPR; // 0–100 scale of civic resonance
    }

    mapping(string => SectorImpact) public impactBySector;
    string[] public trackedSectors;

    event ImpactLogged(string sector, uint256 jobs, uint256 capital, uint256 reintegrated, uint256 businesses, uint256 apr);
    event BroadcastTriggered(string message);

    constructor() {
        // Initialize tracked sectors
        trackedSectors.push("Telecommunications");
        trackedSectors.push("Transport & Logistics");
        trackedSectors.push("Retail Chains");
        trackedSectors.push("Education & Training");
        trackedSectors.push("Digital Services");
    }

    function logImpact(
        string memory sector,
        uint256 jobs,
        uint256 capital,
        uint256 reintegrated,
        uint256 businesses,
        uint256 apr
    ) public {
        impactBySector[sector] = SectorImpact(sector, jobs, capital, reintegrated, businesses, apr);
        emit ImpactLogged(sector, jobs, capital, reintegrated, businesses, apr);
        emit BroadcastTriggered("Sector impact logged and civic resonance updated.");
    }

    function getSectorImpact(string memory sector) public view returns (SectorImpact memory) {
        return impactBySector[sector];
    }

    function broadcastSummary() public view returns (string memory) {
        return "Reform impact across sectors shows rising job creation, capital inflow, and emotional APR. The scrollchain echoes with prosperity.";
    }
}
