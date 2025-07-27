/// @title vinFractalPharmaRegistry
/// @notice Logs medicinal cannabis research, strain metadata, and peer-reviewed outcomes for public integration.
contract vinFractalPharmaRegistry {
    struct Study {
        string researcher;
        string title;
        string strainProfile;
        string methodology;
        string outcomeSummary;
        bool    peerReviewed;
    }

    Study[] public studies;
    event StudyLogged(string title, string researcher);

    function logStudy(
        string calldata researcher,
        string calldata title,
        string calldata strainProfile,
        string calldata methodology,
        string calldata outcomeSummary,
        bool peerReviewed
    ) external {
        studies.push(Study({
            researcher: researcher,
            title: title,
            strainProfile: strainProfile,
            methodology: methodology,
            outcomeSummary: outcomeSummary,
            peerReviewed: peerReviewed
        }));
        emit StudyLogged(title, researcher);
    }

    function totalStudies() external view returns (uint256) {
        return studies.length;
    }
}
