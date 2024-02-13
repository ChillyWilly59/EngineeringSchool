using System.Text.RegularExpressions;

class Program
{
    static void Main(string[] args)
    {
        string inputFile;

        if (args.Length == 0)
        {
            Console.WriteLine("Enter the path of the input file:");
            inputFile = Console.ReadLine();
        }
        else
        {
            inputFile = args[0];
        }

        if (!File.Exists(inputFile))
        {
            Console.WriteLine("Input file not found.");
            return;
        }

        string outputFile = "output.txt";

        try
        {
            string text = File.ReadAllText(inputFile);
            Dictionary<string, int> wordCounts = CountWords(text);
            WriteToFile(outputFile, wordCounts);
            Console.WriteLine($"Word count completed successfully. Results saved in {outputFile}");

            string fullPath = Path.GetFullPath(outputFile);
            Console.WriteLine($"Output file path: {fullPath}");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"An error occurred: {ex.Message}");
        }
    }

    static Dictionary<string, int> CountWords(string text)
    {
        Dictionary<string, int> wordCounts = new Dictionary<string, int>();

        string[] words = Regex.Split(text, @"\W+");

        foreach (string word in words)
        {
            if (!string.IsNullOrWhiteSpace(word))
            {
                string lowerWord = word.ToLower();
                if (wordCounts.ContainsKey(lowerWord))
                {
                    wordCounts[lowerWord]++;
                }
                else
                {
                    wordCounts.Add(lowerWord, 1);
                }
            }
        }

        return wordCounts;
    }

    static void WriteToFile(string filePath, Dictionary<string, int> wordCounts)
    {
        var orderedWordCounts = wordCounts.OrderByDescending(pair => pair.Value);

        using (StreamWriter writer = new StreamWriter(filePath))
        {
            foreach (var pair in orderedWordCounts)
            {
                writer.WriteLine($"{pair.Key}\t{pair.Value}");
            }
        }
    }
}
