# This file contains the nessesary configuration options for RetentionMagic.

# ==> User Class
# The user class that is used by RetentionMagic. The records of this class
# will be tracked and automatically devided into monthly cohort groups.
RetentionMagic.user_class = "User"

# ==> Activation Counters
# This is a list of columns that contain counters towards a user's activation
# actions over the total lifetime of the user.
#
# For example, when you have a blogging app and the number of posts someone
# writes is an important metric for your app you would specify:
#
#   RetentionMagic.activation_counter_columns = [ :posts_count ]
#
# These column need to be present on the model you specified as user_class.
# For example, you can use Rails counter_cache on a Post=>belongs_to=>User
# relation to keep the posts_count column up-to-date.
#
RetentionMagic.activation_counter_columns = [ ]

# ==> Retention Models
# This is the list of model class names that you want to track retention for.
# RetentionMagic will use the model's created_at column to build a retention
# graph for your users. If you add more than one model, any of them count
# towards the retention of your user.
#
# For example, when you run a blogging app or maybe a forum app and writing
# posts and commenting on other people's post is your metric for activation,
# you would specify:
#
#   RetentionMagic.retention_models = %w( Post Comment )
#
RetentionMagic.retention_models = %w()
